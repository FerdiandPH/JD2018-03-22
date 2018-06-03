package by.it.kirova.jd03_04.java;

enum Actions {
    INDEX {
        {
            this.command = new CmdIndex();
            this.jsp = "/index.jsp";
        }
    },
    LOGIN {
        {
            this.command = new CmdLogin();
            this.jsp = "/login.jsp";
        }
    },
    LOGOUT {
        {
            this.command = new CmdLogout();
            this.jsp = "/logout.jsp";
        }
    },
    SIGNUP {
        {
            this.command = new CmdSingup();
            this.jsp = "/signup.jsp";
        }
    },
    ERROR {
        {
            this.command = new CmdError();
            this.jsp = "/error.jsp";
        }
    };

    String jsp = "/error.jsp";
    IActionCmd command;

}
