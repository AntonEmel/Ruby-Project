class Configurations
    class << self
       unless @instance
         EMAIL_USER_1 = "ololo.gm.1"
          PASSWORD_USER_1 = "A1234sdf"
          EMAIL_USER_2 = "ololo.gm.2"
          PASSWORD_USER_2 = "A1234sdf"

          def get_email_1
            EMAIL_USER_1
          end

          def get_password_1
            PASSWORD_USER_1
          end

          def get_email_2
            EMAIL_USER_1
          end

          def get_password_2
            PASSWORD_USER_1
          end
       end
      @instance ||= self
      end
end