package com.cdfamedy.worklow.cart;

/**
 * Created by jackie on 5/7/2016.
 * 五折卡未解锁异常
 */
public class FiveCardUnlockException extends Exception {
    private boolean isFiveCardUnlocked;

    public FiveCardUnlockException(boolean currentFiveCardStatus) {
        super();
        this.isFiveCardUnlocked = currentFiveCardStatus;
    }

    public boolean isFiveCardUnlocked() {
        return isFiveCardUnlocked;
    }

    public void setFiveCardUnlocked(boolean fiveCardUnlocked) {
        this.isFiveCardUnlocked = fiveCardUnlocked;
    }
}
