/*global $, document, window, setTimeout, navigator, console, location*/
$(document).ready(function () {

    'use strict';

    var usernameError = true,
        userIdError   = true,
        emailError    = true,
        passwordError = true,
        birthError    = true,
        passConfirm   = true;

    var userIdRegex = /^[a-z0-9]+$/;

    // Detect browser for css purpose
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        $('.form form label').addClass('fontSwitch');
    }

    // Label effect
    $('input').focus(function () {
        $(this).siblings('label').addClass('active');
    });

    // Form validation
    $('input').blur(function () {

        // User Name
        if ($(this).hasClass('name')) {
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('이름을 입력해주세요.').fadeIn().parent('.form-group').addClass('hasError');
                usernameError = true;
            } else if ($(this).val().length > 0 && $(this).val().length <= 1) {
                $(this).siblings('span.error').text('2자 이상 입력 해 주세요').fadeIn().parent('.form-group').addClass('hasError');
                usernameError = true;
            } else {
                $(this).siblings('span.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                usernameError = false;
            }
        }

        // User Id
        if ($(this).hasClass('userId')) {
            var userId = $(this).val();
            if (userId.length === 0) {
                $(this).siblings('span.error').text('아이디는 공백으로 둘 수 없습니다.').fadeIn().parent('.form-group').addClass('hasError');
                userIdError = true;
            } else if (userId.length >= 1 && userId.length <= 3) {
                $(this).siblings('span.error').text('아이디는 4자 이상 입력 해 주세요').fadeIn().parent('.form-group').addClass('hasError');
                userIdError = true;
            } else if (!userIdRegex.test(userId)) {
                $(this).siblings('span.error').text('아이디는 영문 소문자와 숫자로만 구성되어야 합니다').fadeIn().parent('.form-group').addClass('hasError');
                userIdError = true;
            } else {
                $(this).siblings('span.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                userIdError = false;
            }
        }

        // Email
        if ($(this).hasClass('email')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('이메일 주소를 확인 해 주세요').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            } else {
                $(this).siblings('span.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                emailError = false;
            }
        }

        // PassWord
        if ($(this).hasClass('pass')) {
            if ($(this).val().length < 8) {
                $(this).siblings('span.error').text('최소 8자 이상 입력 해 주세요').fadeIn().parent('.form-group').addClass('hasError');
                passwordError = true;
            } else {
                $(this).siblings('span.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                passwordError = false;
            }
        }

        // Birthday
        if ($(this).hasClass('birth')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('생년월일을 입력 해 주세요.').fadeIn().parent('.form-group').addClass('hasError');
                birthError = true;
            } else {
                $(this).siblings('span.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                birthError = false;
            }
        }

        // PassWord confirmation
        if ($('.pass').val() !== $('.passConfirm').val()) {
            $('.passConfirm').siblings('span.error').text('비밀번호 불일치').fadeIn().parent('.form-group').addClass('hasError');
            passConfirm = true;
        } else {
            $('.passConfirm').siblings('span.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
            passConfirm = false;
        }

        // label effect
        if ($(this).val().length > 0) {
            $(this).siblings('label').addClass('active');
        } else {
            $(this).siblings('label').removeClass('active');
        }
    });

    // form switch
    $('a.switch').click(function (e) {
        $(this).toggleClass('active');
        e.preventDefault();

        if ($('a.switch').hasClass('active')) {
            $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
        } else {
            $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
        }
    });

    
    // Form submit
    $('form.signup-form').submit(function (event) {
        event.preventDefault();

        if (usernameError == true || emailError == true || passwordError == true || passConfirm == true || userIdError == true || birthError == true) {
            $('.name, .email, .pass, .passConfirm, .userId, .birth').blur();
        } else {
            var formData = $(this).serialize();
            $.ajax({
                type: 'POST',
                url: '/all_about_knowledge/join.do',
                data: formData,
                success: function () {
                    $('.signup, .login').addClass('switched');
                    setTimeout(function () { $('.signup, .login').hide(); }, 700);
                    setTimeout(function () { $('.brand').addClass('active'); }, 300);
                    setTimeout(function () { $('.heading').addClass('active'); }, 600);
                    setTimeout(function () { $('.success-msg p').addClass('active'); }, 900);
                    setTimeout(function () { $('.success-msg a').addClass('active'); }, 1050);
                    setTimeout(function () { $('.form').hide(); }, 700);
                },
                error: function () {
                    alert('회원가입 중 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        }
    });


    // Reload page
    $('a.profile').on('click', function () {
        location.reload(true);
    });

});