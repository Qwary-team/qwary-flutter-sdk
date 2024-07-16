package com.qwary.qwray_plugin

data class QwSettings(
    val appId: String?,
    val osPlatform: String? = "Android",
    val firstName: String? = null,
    val lastName: String? = null,
    val email: String? = null
)