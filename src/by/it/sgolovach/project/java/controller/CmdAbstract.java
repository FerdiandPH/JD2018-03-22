package by.it.sgolovach.project.java.controller;

import javax.servlet.http.HttpServletRequest;

public abstract class CmdAbstract {

    abstract CmdAbstract execute(HttpServletRequest req) throws Exception;


    @Override
    public String toString() {
        String name = this.getClass().getSimpleName().replaceFirst("Cmd","");
        return name;
    }
    public String getJsp(){
        return "/" + this.toString().toLowerCase()+".jsp";
    }
}
