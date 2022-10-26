package com.example.web.login;

import org.seasar.teeda.extension.annotation.validator.Email;
import org.seasar.teeda.extension.annotation.validator.Length;
import org.seasar.teeda.extension.annotation.validator.Required;

import com.example.web.member.UserPage;

public class LoginPage {
  private String titleValue = "LoginPage";
  private String sign;

  private String email;

  private String password;

  public String getTitleValue() {
    return titleValue;
  }

  public String getSign() {
    return sign;
  }

  public String getEmail() {
    return email;
  }

  public String getPassword() {
    return password;
  }

  @Required(target = "doUserPage", messageId = "login.form.email.value")
  @Email(messageId = "login.form.email")
  public void setEmail(String email) {
    this.email = email;
  }

  @Required(target = "doUserPage", messageId = "login.form.password.value")
  @Length(minimum = 4, minimumMessageId = "login.form.password")
  public void setPassword(String password) {
    this.password = password;
  }

  public Class<?> getLayout() {
    return null;
  }

  public void setTitleValue(String titleValue) {
    this.titleValue = titleValue;
  }

  public void setSign(String sign) {
    this.sign = sign;
  }

  public Class<?> doUserPage() {
    return UserPage.class;
  }

  public Class initialize() {
    return null;
  }

  public Class prerender() {
    return null;
  }

}
