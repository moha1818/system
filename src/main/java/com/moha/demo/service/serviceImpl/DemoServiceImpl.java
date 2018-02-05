package com.moha.demo.service.serviceImpl;

import com.moha.demo.service.DemoService;
import com.moha.demo.threadpool.StartTaskThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;

@Service
public class DemoServiceImpl implements DemoService{

    private static int produceTaskSleepTime = 10;

    private static int produceTaskMaxNumber = 100;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    public ThreadPoolTaskExecutor getThreadPoolTaskExecutor() {
        return threadPoolTaskExecutor;
    }

    public void setThreadPoolTaskExecutor(
            ThreadPoolTaskExecutor threadPoolTaskExecutor) {
        this.threadPoolTaskExecutor = threadPoolTaskExecutor;
    }

    public void testThreadPoolExecutor() {
        for (int i = 1; i <= produceTaskMaxNumber; i++) {
            try {
                Thread.sleep(produceTaskSleepTime);
            } catch (InterruptedException e1) {
                e1.printStackTrace();
            }
            new Thread(new StartTaskThread(threadPoolTaskExecutor, i)).start();
        }

    }

    @Override
    public void ser(){
        testThreadPoolExecutor();
    }
}
