package ru.exsoft.likepizza.apidao;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import ru.exsoft.likepizza.entity.User;
import ru.exsoft.likepizza.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

public class CustomAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    @Autowired
    UserService userService;

    public CustomAuthenticationSuccessHandler() {
        super();
        setRedirectStrategy(new NoRedirectStrategy());
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException  {
        Optional<User> user = userService.findUserById(((User) authentication.getPrincipal()).getId());

        response.setContentType("application/json");
        if (user.isPresent()){
            response.setStatus(HttpStatus.OK.value());
            response.getWriter().write(new ObjectMapper().writeValueAsString(user.get()));
            response.flushBuffer();
        } else {
            response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
            response.getWriter().write(new ObjectMapper().writeValueAsString(null));
            response.flushBuffer();
        }
    }

    protected static class NoRedirectStrategy implements RedirectStrategy {
        @Override
        public void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
            //noop
        }
    }
}
