package com.offbytwo.jenkins.JenkinsServer;

public class GroovyJ {
    public static void main(String[] args){
        JenkinsServer jenkins = new JenkinsServer(new URI("127.0.0.1"), "netjargon", "burgundy");

        Map<String, Job> jobs = jenkins.getJobs();
    }
    
}