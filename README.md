# Scheduled jobs

Collection of jobs executed regularly to automate different tasks.


## Manage poll

**Worklow file:** [manage-poll.yml](.github/workflows/manage-poll.yml)

**Description:** Delete the past and add a new Saturday to the framadate poll.

**Requirements:**
- Repository/organization secret
  - Key: `FRAMADATE_ADMIN_URL`
  - Value: Framadate poll's admin url


## Notify discord

**Worklow file:** [notify-discord.yml](.github/workflows/notify-discord.yml)

**Description:** Notify users on Discord who are participating in next game day.

**Requirements:**
- Repository/organization secret
  - Key: `DISCORD_USERNAME_MAP`
  - Value: See [#discord-username-map](Discord username map)
- Repository/organization secret
  - Key: `DISCORD_WEBHOOK_URL`
  - Value: As the key suggests
- Repository/organization secret
  - Key: `FRAMADATE_ADMIN_URL`
  - Value: Framadate poll's admin url


### Discord username map

**Format:** JSON

**Content:**

```
{
	"<FRAMADATE_POLL_USERNAME>": "<DISCORD_USER_ID>",
    ...
}
```

**Example:**

```
{
	"Sample user 1": "123456789123456789",
	"Sample user 2": "987654321987654321"
}
```

**Info:** In order to get the Discord user ID, either

- send message `\@USERNAME`
- or open user profile, then copy user ID
