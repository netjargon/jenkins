package com.offbytwo.jenkins.JenkinsServer;

public class GroovyJ {
    JenkinsServer jenkins = new JenkinsServer(new URI("127.0.0.1"), "netjargon", "burgundy");

    Map<String, Job> jobs = jenkins.getJobs();
}