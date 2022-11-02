class ApplicationController < ActionController::Base
    def mustLogin
        if session[:loggedin] == true
            return true
        else
            redirect_to main_login_path
            return false
        end
    end
end
