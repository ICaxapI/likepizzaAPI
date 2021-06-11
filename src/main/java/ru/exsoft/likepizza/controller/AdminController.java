package ru.exsoft.likepizza.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import ru.exsoft.likepizza.apidao.AddPrizeRequest;
import ru.exsoft.likepizza.apidao.AddUserRequest;
import ru.exsoft.likepizza.apidao.CustomizedExceptionResponse;
import ru.exsoft.likepizza.entity.Prize;
import ru.exsoft.likepizza.entity.Role;
import ru.exsoft.likepizza.entity.User;
import ru.exsoft.likepizza.repository.RoleRepository;
import ru.exsoft.likepizza.service.PrizeService;
import ru.exsoft.likepizza.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.annotation.security.RolesAllowed;
import javax.validation.Valid;
import javax.validation.constraints.Positive;
import java.util.*;
import java.util.stream.Collectors;

@Validated
@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PrizeService prizeService;

    @RolesAllowed("ROLE_ADMIN")
    @GetMapping("/api/users")
    public ResponseEntity<?> userList(Authentication authentication) {
        List<User> userList = userService.getAllUsers();
        return new ResponseEntity<>(userList, HttpStatus.OK);
    }

    @RolesAllowed({"ROLE_OPERATOR", "ROLE_ADMIN", "ROLE_USER"})
    @GetMapping("/api/user")
    public ResponseEntity<?> currentUser(Authentication authentication) {
        if (authentication.isAuthenticated()) {
            User currentUser = (User) authentication.getPrincipal();
            return new ResponseEntity<>(currentUser, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new CustomizedExceptionResponse("Ты не авторизован", HttpStatus.UNAUTHORIZED.value()), HttpStatus.UNAUTHORIZED);
        }
    }

    @RolesAllowed("ROLE_ADMIN")
    @GetMapping("/api/user/{userId}")
    public ResponseEntity<?> userGet(@PathVariable @Valid @Positive(message="Must be greater then 0") Long userId, Authentication authentication) {
        Optional<User> user = userService.findUserById(userId);
        return new ResponseEntity<>(user.isPresent() ? user : null, user.isPresent() ? HttpStatus.OK : HttpStatus.NOT_FOUND);
    }

    @RolesAllowed("ROLE_ADMIN")
    @DeleteMapping("/api/user/{userId}")
    public ResponseEntity<?> userDelete(@PathVariable @Valid @Positive Long userId, Authentication authentication) {
        boolean status = userService.deleteUser(userId);
        return new ResponseEntity<>(status ? HttpStatus.OK : HttpStatus.NOT_FOUND);
    }

    @RolesAllowed("ROLE_ADMIN")
    @PostMapping("/api/user")
    public ResponseEntity<?> addUser(@RequestBody @Valid AddUserRequest addUserRequest, Authentication authentication) {
        List<Role> allRoles = roleRepository.findAll();
        Set<Role> userRoles = allRoles.stream().filter(role -> addUserRequest.getRoles().contains(role.getName())).collect(Collectors.toSet());
        User detachedUser = new User().setUsername(addUserRequest.getUsername()).setPassword(addUserRequest.getPassword()).setRoles(userRoles);
        User newUser = userService.saveUser(detachedUser);
        return new ResponseEntity<>(newUser, null != newUser ? HttpStatus.OK : HttpStatus.CONFLICT);
    }

    @RolesAllowed("ROLE_ADMIN")
    @PostMapping("/api/prize")
    public ResponseEntity<?> addPrize(@RequestBody @Valid AddPrizeRequest addPrizeRequest, Authentication authentication) {
        Prize detachedPrize = new Prize()
                .setDescription(addPrizeRequest.getDescription())
                .setExpiresIn(addPrizeRequest.getExpiresIn())
                .setName(addPrizeRequest.getName())
                .setRarity(addPrizeRequest.getRarity())
                .setEnabled(addPrizeRequest.isEnabled())
                .setPiecesLeft(addPrizeRequest.getPiecesLeft())
                .setRedirect(addPrizeRequest.getRedirect());
        Prize newPrize = prizeService.savePrize(detachedPrize);
        return new ResponseEntity<>(newPrize, null != newPrize ? HttpStatus.OK : HttpStatus.CONFLICT);
    }

    @RolesAllowed("ROLE_ADMIN")
    @PatchMapping("/api/prize/{prizeId}")
    public ResponseEntity<?> updatePrize(@RequestBody @Valid AddPrizeRequest addPrizeRequest, @PathVariable @Valid @Positive Long prizeId, Authentication authentication) {
        Prize detachedPrize = new Prize()
                .setDescription(addPrizeRequest.getDescription())
                .setExpiresIn(addPrizeRequest.getExpiresIn())
                .setName(addPrizeRequest.getName())
                .setRarity(addPrizeRequest.getRarity())
                .setEnabled(addPrizeRequest.isEnabled())
                .setPiecesLeft(addPrizeRequest.getPiecesLeft())
                .setRedirect(addPrizeRequest.getRedirect())
                .setId(prizeId);
        if (detachedPrize.isEnabled()) {
            if (prizeService.getAllPrizes().stream().filter(Prize::isEnabled).count() <= 15) {
                boolean success = prizeService.updatePrize(detachedPrize);
                return new ResponseEntity<>(success ? HttpStatus.OK : HttpStatus.CONFLICT);
            } else {
                Map<String, Object> data = new HashMap<>();
                data.put("error", "Не может быть включено больше 16 призов, сначала отключите какой-либо другой.");
                return new ResponseEntity<>(data, HttpStatus.CONFLICT);
            }
        } else {
            boolean success = prizeService.updatePrize(detachedPrize);
            return new ResponseEntity<>(success ? HttpStatus.OK : HttpStatus.CONFLICT);
        }
    }

    @RolesAllowed("ROLE_ADMIN")
    @GetMapping("/api/prizes")
    public ResponseEntity<?> getAllPrizes(Authentication authentication) {
         return new ResponseEntity<>(prizeService.getAllPrizes(), HttpStatus.OK);
    }
}
