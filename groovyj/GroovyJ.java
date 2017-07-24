package com.offbytwo.jenkins.JenkinsServer;

public class GroovyJ {
    public static void main(String[] args){
        JenkinsServer jenkins = new JenkinsServer(new URI("http://localhost:8081/"), "netjargon", "burgundy");

        Map<String, Job> jobs = jenkins.getJobs();
    }
    
}