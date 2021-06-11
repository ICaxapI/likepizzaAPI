package ru.exsoft.likepizza.apidao;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import ru.exsoft.likepizza.entity.User;
import ru.exsoft.likepizza.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
    @Autowired
    UserService userService;

    public CustomLogoutSuccessHandler() {
        super();
        setRedirectStrategy(new NoRedirectStrategy());
    }

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException  {
        response.setContentType("application/json");
        response.setStatus(HttpStatus.OK.value());
        response.flushBuffer();
    }

    protected static class NoRedirectStrategy implements RedirectStrategy {
        @Override
        public void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
            //noop
        }
    }
}
