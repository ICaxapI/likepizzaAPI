package ru.exsoft.likepizza.service;


import ru.exsoft.likepizza.entity.User;
import ru.exsoft.likepizza.repository.RoleRepository;
import ru.exsoft.likepizza.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public Optional<User> findUserById(Long userId) {
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public boolean updateUser(User user) {
        Optional<User> userFromDBO = userRepository.findById(user.getId());
        if (userFromDBO.isPresent()) {
            userRepository.save(user);
            return true;
        }
        return false;
    }

    public User saveUser(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return null;
        }

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }
}
