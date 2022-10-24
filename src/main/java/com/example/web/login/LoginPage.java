package com.example.web.login;

public class LoginPage {
  private String title = "Login";
  private String sign;

  public String getTitle() {
    return title;
  }

  public String getSign() {
    return sign;
  }

  public Class<?> getLayout() {
    return null;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public void setSign(String sign) {
    this.sign = sign;
  }

  public Class initialize() {
    return null;
  }

  public Class prerender() {
    return null;
  }

}
