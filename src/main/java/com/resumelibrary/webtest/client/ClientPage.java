package com.resumelibrary.webtest.client;

import com.resumelibrary.utilities.Utility;
import com.resumelibrary.utilities.WebURLHelper;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

public class ClientPage extends Utility {

    public ClientPage() {
        PageFactory.initElements(getThreadDriver(), this);
    }

    private static final Logger logger = LogManager.getLogger(ClientPage.class);

    @FindBy(id = "inquiry_type")
    WebElement InquiryType;
    @FindBy(id = "message")
    WebElement Message;
    @FindBy(id = "register_now")
    static WebElement SubmitInquiry;
    @FindBy(id = "company_name")
    WebElement CompanyName;
    @FindBy(id = "wysiwg-post-job-btn")
    WebElement PostAJob;
    @FindBy(xpath = "(//div[@class='card card--shadow article-module']//following::img)[1]")
    WebElement advanceImage;
    @FindBy(xpath = "//*[@id='main']//div/ul/li[9]/a")
    WebElement ContactUs;
    @FindBy(xpath = "//*[@id='main']//div/ul/li[8]/a")
    WebElement DownloadUserManual;
    @FindBy(xpath = "//*[contains(text(),'Download')]")
    WebElement Download;

    public boolean isImageDisplayed() {
        if (advanceImage.isDisplayed()) {
            logger.info("Image is displayed under Search Tips");
            return true;
        } else {
            logger.info("Image is not displayed under Search Tips");
            return false;
        }
    }

    public void selectInquiryType(String inquiryType) {
        selectByVisibleTextFromDropDownWithJS(InquiryType, inquiryType);
    }

    public void enterMessage(String value) {
        Message.sendKeys(value);
        Message.sendKeys(Keys.ENTER);
    }

    public void clickOnSubmitInquiry() {
        clickOnElementWithJS(SubmitInquiry);
    }

    public void enterCompanyName(String companyName) {
        CompanyName.sendKeys(companyName);
    }

    public void verifyUrls(String url1, String url2) {
        getDriverWithUrl(WebURLHelper.getWebUrl(), getURL(url1));
        String presentURL = getPresentURL();
        waitUntil(WebURLHelper.getWebUrl() + getURL(url2));
        Assert.assertTrue(presentURL.contains(getURL(url2)));
        waitFor(1);
    }

    public void clickOnPostAJob() {
        logger.info("click on the button Post a Job --> ");
        clickOnElement(PostAJob);
    }

    public void clickOnContactUs() {
        logger.info("click on contact us --> ");
        clickOnElement(ContactUs);
    }
    public void clickOnDownloadUserManual() {
        logger.info("click on Download User Manual --> ");
        clickOnElement(DownloadUserManual);
    }

    public void clickOnDownload() {
        logger.info("click on Download --> ");
        clickOnElement(Download);
    }

    public void selectTheOptionValueFromInquiryType(String optionValue) {
        waitUntilElementToBeClickable(InquiryType, 4);
        clickOnElement(InquiryType);
        clickOnAttributeValueOnInputTag(optionValue);
    }
}