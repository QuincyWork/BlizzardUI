local contents = {};
local issecure = issecure;
local type = type;
local pairs = pairs;

--Create a local version of this function just so we don't have to worry about changes
local function copyTable(tab)
	local copy = {};
	for k, v in pairs(tab) do
		if ( type(v) == "table" ) then
			copy[k] = copyTable(v);
		else
			copy[k] = v;
		end
	end
	return copy;
end

function SecureCapsuleGet(name)
	if ( not issecure() ) then
		return;
	end

	if ( type(contents[name]) == "table" ) then
		--Segment the users
		return copyTable(contents[name]);
	else
		return contents[name];
	end
end

-------------------------------
--Local functions for retaining.
-------------------------------

--Retains a copy of name
local function retain(name)
	if ( type(_G[name]) == "table" ) then
		contents[name] = copyTable(_G[name]);
	else
		contents[name] = _G[name];
	end
end

--Takes name and removes it from the global environment (note: make sure that nothing else has saved off a copy)
local function take(name)
	contents[name] = _G[name];
	_G[name] = nil;
end


-------------------------------
--Things we actually want to save
-------------------------------

--If storing off Lua functions, be careful that they don't in turn call any other Lua functions that may have been swapped out.

--For store
if ( IsGMClient() ) then
	retain("C_PurchaseAPI");
	retain("HideGMOnly");
else
	take("C_PurchaseAPI");
end
take("CreateForbiddenFrame");
retain("IsGMClient");
retain("IsOnGlueScreen");
retain("math");
retain("table");
retain("string");
retain("pairs");
retain("ipairs");
retain("select");
retain("unpack");
retain("tostring");
retain("tonumber");
retain("date");
retain("time");
retain("type");
retain("wipe");
retain("LoadURLIndex");
retain("GetContainerNumFreeSlots");
retain("GetCursorPosition");
retain("GetRealmName");
retain("PlaySound");
retain("SetPortraitToTexture");
retain("BACKPACK_CONTAINER");
retain("NUM_BAG_SLOTS");
retain("RAID_CLASS_COLORS");
retain("CLASS_ICON_TCOORDS");
retain("C_PetJournal");
retain("C_Timer");
retain("IsModifiedClick");
retain("GetTime");
retain("UnitAffectingCombat");
retain("GetCVar");
retain("GMError");
retain("GetMouseFocus");
retain("LOCALE_enGB");

--For auth challenge
take("C_AuthChallenge");
retain("IsShiftKeyDown");
retain("GetBindingFromClick");

--For character services
take("C_SharedCharacterServices");
retain("C_ClassTrial");

--For secure transfer
take("C_SecureTransfer");

--GlobalStrings
retain("BLIZZARD_STORE");
retain("ACCEPT");
take("BLIZZARD_STORE_ON_SALE");
take("BLIZZARD_STORE_BUY");
take("BLIZZARD_STORE_BUY_EUR");
take("BLIZZARD_STORE_PLUS_TAX");
take("BLIZZARD_STORE_PRODUCT_INDEX");
take("BLIZZARD_STORE_CANCEL_PURCHASE");
take("BLIZZARD_STORE_FINAL_BUY");
take("BLIZZARD_STORE_FINAL_BUY_EUR");
take("BLIZZARD_STORE_CONFIRMATION_TITLE");
take("BLIZZARD_STORE_CONFIRMATION_INSTRUCTION");
take("BLIZZARD_STORE_FINAL_PRICE_LABEL");
take("BLIZZARD_STORE_PAYMENT_METHOD");
take("BLIZZARD_STORE_PAYMENT_METHOD_EXTRA");
take("BLIZZARD_STORE_LOADING");
take("BLIZZARD_STORE_PLEASE_WAIT");
take("BLIZZARD_STORE_NO_ITEMS");
take("BLIZZARD_STORE_CHECK_BACK_LATER");
take("BLIZZARD_STORE_TRANSACTION_IN_PROGRESS");
take("BLIZZARD_STORE_CONNECTING");
take("BLIZZARD_STORE_VISIT_WEBSITE");
take("BLIZZARD_STORE_VISIT_WEBSITE_WARNING");
take("BLIZZARD_STORE_BAG_FULL");
take("BLIZZARD_STORE_BAG_FULL_DESC");
take("BLIZZARD_STORE_CONFIRMATION_GENERIC");
take("BLIZZARD_STORE_CONFIRMATION_TEST");
take("BLIZZARD_STORE_CONFIRMATION_EUR");
take("BLIZZARD_STORE_CONFIRMATION_SERVICES");
take("BLIZZARD_STORE_CONFIRMATION_SERVICES_TEST");
take("BLIZZARD_STORE_CONFIRMATION_SERVICES_EUR");
take("BLIZZARD_STORE_CONFIRMATION_VAS_NAME_CHANGE");
take("BLIZZARD_STORE_CONFIRMATION_VAS_NAME_CHANGE_EUR");
take("BLIZZARD_STORE_CONFIRMATION_VAS_NAME_CHANGE_KR");
take("BLIZZARD_STORE_CONFIRMATION_OTHER");
take("BLIZZARD_STORE_CONFIRMATION_OTHER_EUR");
take("BLIZZARD_STORE_BROWSE_TEST_CURRENCY");
take("BLIZZARD_STORE_BATTLE_NET_BALANCE");
take("BLIZZARD_STORE_CURRENCY_FORMAT_USD");
take("BLIZZARD_STORE_CURRENCY_FORMAT_KRW_LONG");
take("BLIZZARD_STORE_CURRENCY_FORMAT_CPT_LONG");
take("BLIZZARD_STORE_CURRENCY_FORMAT_TPT");
take("BLIZZARD_STORE_CURRENCY_FORMAT_GBP");
take("BLIZZARD_STORE_CURRENCY_FORMAT_EURO");
take("BLIZZARD_STORE_CURRENCY_FORMAT_RUB");
take("BLIZZARD_STORE_CURRENCY_FORMAT_MXN");
take("BLIZZARD_STORE_CURRENCY_FORMAT_BRL");
take("BLIZZARD_STORE_CURRENCY_FORMAT_ARS");
take("BLIZZARD_STORE_CURRENCY_FORMAT_CLP");
take("BLIZZARD_STORE_CURRENCY_FORMAT_AUD");
take("BLIZZARD_STORE_CURRENCY_RAW_ASTERISK");
take("BLIZZARD_STORE_CURRENCY_BETA");
take("BLIZZARD_STORE_BROWSE_BATTLE_COINS_KR");
take("BLIZZARD_STORE_BROWSE_BATTLE_COINS_CN");
take("BLIZZARD_STORE_BROWSE_EUR");
take("BLIZZARD_STORE_ASTERISK");
take("BLIZZARD_STORE_INTERNAL_ERROR");
take("BLIZZARD_STORE_INTERNAL_ERROR_SUBTEXT");
take("BLIZZARD_STORE_ERROR_TITLE_OTHER");
take("BLIZZARD_STORE_ERROR_MESSAGE_OTHER");
take("BLIZZARD_STORE_NOT_AVAILABLE");
take("BLIZZARD_STORE_NOT_AVAILABLE_SUBTEXT");
take("BLIZZARD_STORE_ERROR_TITLE_PAYMENT");
take("BLIZZARD_STORE_ERROR_MESSAGE_PAYMENT");
take("BLIZZARD_STORE_ERROR_TITLE_BATTLEPAY_DISABLED");
take("BLIZZARD_STORE_ERROR_MESSAGE_BATTLEPAY_DISABLED");
take("BLIZZARD_STORE_SECOND_CHANCE_KR");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_CN");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_TW");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_USD");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_GBP");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_EUR");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_RUB");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_ARS");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_CLP");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_MXN");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_BRL");
take("BLIZZARD_STORE_LICENSE_ACK_TEXT_AUD");
take("BLIZZARD_STORE_REGION_LOCKED");
take("BLIZZARD_STORE_REGION_LOCKED_SUBTEXT");
take("BLIZZARD_STORE_ERROR_TITLE_INSUFFICIENT_BALANCE");
take("BLIZZARD_STORE_ERROR_MESSAGE_INSUFFICIENT_BALANCE");
take("BLIZZARD_STORE_ERROR_TITLE_ALREADY_OWNED");
take("BLIZZARD_STORE_ERROR_MESSAGE_ALREADY_OWNED");
take("BLIZZARD_STORE_ERROR_TITLE_PARENTAL_CONTROLS");
take("BLIZZARD_STORE_ERROR_MESSAGE_PARENTAL_CONTROLS");
take("BLIZZARD_STORE_ERROR_TITLE_PURCHASE_DENIED");
take("BLIZZARD_STORE_ERROR_MESSAGE_PURCHASE_DENIED");
take("BLIZZARD_STORE_ERROR_TITLE_CONSUMABLE_TOKEN_OWNED");
take("BLIZZARD_STORE_ERROR_MESSAGE_CONSUMABLE_TOKEN_OWNED");
take("BLIZZARD_STORE_ERROR_ITEM_UNAVAILABLE");
take("BLIZZARD_STORE_ERROR_YOU_OWN_TOO_MANY_OF_THIS")
take("BLIZZARD_STORE_DISCOUNT_TEXT_FORMAT");
take("BLIZZARD_STORE_PAGE_NUMBER");
take("BLIZZARD_STORE_SPLASH_BANNER_DISCOUNT_FORMAT");
take("BLIZZARD_STORE_SPLASH_BANNER_FEATURED");
take("BLIZZARD_STORE_SPLASH_BANNER_NEW");
take("BLIZZARD_STORE_WALLET_INFO");
take("BLIZZARD_STORE_PROCESSING");
take("BLIZZARD_STORE_PURCHASE_SENT");
take("BLIZZARD_STORE_BEING_PROCESSED_CHECK_BACK_LATER");
take("BLIZZARD_STORE_YOU_ALREADY_OWN_THIS");
take("BLIZZARD_STORE_TOKEN_CURRENT_MARKET_PRICE");
take("BLIZZARD_STORE_TOKEN_DESC_30_DAYS");
take("BLIZZARD_STORE_TOKEN_DESC_2700_MINUTES");
take("BLIZZARD_STORE_LOG_OUT_TO_PURCHASE_THIS_PRODUCT");
take("BLIZZARD_STORE_PRODUCT_IS_READY");
take("BLIZZARD_STORE_VAS_SERVICE_READY_DESCRIPTION");
take("BLIZZARD_STORE_NAME_CHANGE_READY_DESCRIPTION");
take("BLIZZARD_STORE_LEGION_PURCHASE_READY_DESCRIPTION");
take("BLIZZARD_STORE_LEGION_PURCHASE_READY");
take("CHARACTER_UPGRADE_LOG_OUT_NOW");
take("CHARACTER_UPGRADE_POPUP_LATER");
take("CHARACTER_UPGRADE_READY");
take("CHARACTER_UPGRADE_READY_DESCRIPTION");
take("FREE_CHARACTER_UPGRADE_READY");
take("FREE_CHARACTER_UPGRADE_READY_DESCRIPTION");
take("CHARACTER_UPGRADE_CLASS_TRIAL_UNLOCK_READY_DESCRIPTION");
take("VAS_SELECT_CHARACTER_DISABLED");
take("VAS_SELECT_CHARACTER");
take("VAS_CHARACTER_LABEL");
take("VAS_SELECT_REALM");
take("VAS_REALM_LABEL");
take("VAS_CHARACTER_SELECTION_DESCRIPTION");
take("VAS_SELECTED_CHARACTER_DESCRIPTION");
take("VAS_NEW_CHARACTER_NAME_LABEL");
take("VAS_DESTINATION_REALM_LABEL");
take("VAS_NAME_CHANGE_TOOLTIP");
take("VAS_NAME_CHANGE_CONFIRMATION");
take("VAS_APPEARANCE_CHANGE_CONFIRMATION");
take("VAS_FACTION_CHANGE_CONFIRMATION");
take("VAS_RACE_CHANGE_CONFIRMATION");
take("VAS_CHARACTER_TRANSFER_CONFIRMATION");
take("VAS_RACE_CHANGE_VALIDATION_DESCRIPTION");
take("VAS_FACTION_CHANGE_VALIDATION_DESCRIPTION");
take("VAS_APPEARANCE_CHANGE_VALIDATION_DESCRIPTION");
take("BLIZZARD_STORE_VAS_ERROR_REALM_NOT_ELIGIBLE");
take("BLIZZARD_STORE_VAS_ERROR_CANNOT_MOVE_GUILDMASTER");
take("BLIZZARD_STORE_VAS_ERROR_DUPLICATE_CHARACTER_NAME");
take("BLIZZARD_STORE_VAS_ERROR_HAS_MAIL");
take("BLIZZARD_STORE_VAS_ERROR_UNDER_MIN_LEVEL_REQ");
take("BLIZZARD_STORE_VAS_ERROR_TOO_MUCH_MONEY_FOR_LEVEL");
take("BLIZZARD_STORE_VAS_ERROR_HAS_AUCTIONS");
take("BLIZZARD_STORE_VAS_ERROR_NAME_NOT_AVAILABLE");
take("BLIZZARD_STORE_VAS_ERROR_LAST_RENAME_TOO_RECENT");
take("BLIZZARD_STORE_VAS_ERROR_CUSTOMIZE_ALREADY_REQUESTED");
take("BLIZZARD_STORE_VAS_ERROR_LAST_CUSTOMIZE_TOO_SOON");
take("BLIZZARD_STORE_VAS_ERROR_FACTION_CHANGE_TOO_SOON");
take("BLIZZARD_STORE_VAS_ERROR_RACE_CLASS_COMBO_INELIGIBLE");
take("BLIZZARD_STORE_VAS_ERROR_INELIGIBLE_MAP_ID");
take("BLIZZARD_STORE_VAS_ERROR_BATTLEPAY_DELIVERY_PENDING");
take("BLIZZARD_STORE_VAS_ERROR_HAS_WOW_TOKEN");
take("BLIZZARD_STORE_VAS_ERROR_CHARACTER_LOCKED");
take("BLIZZARD_STORE_VAS_ERROR_LAST_SAVE_TOO_RECENT");
take("BLIZZARD_STORE_VAS_ERROR_OTHER");
take("BLIZZARD_STORE_VAS_ERROR_LABEL");
take("BLIZZARD_STORE_DISCLAIMER_FACTION_CHANGE");
take("BLIZZARD_STORE_DISCLAIMER_RACE_CHANGE");
take("BLIZZARD_STORE_DISCLAIMER_APPEARANCE_CHANGE");
take("BLIZZARD_STORE_DISCLAIMER_NAME_CHANGE");
take("BLIZZARD_STORE_DISCLAIMER_FACTION_CHANGE_CN");
take("BLIZZARD_STORE_DISCLAIMER_RACE_CHANGE_CN");
take("BLIZZARD_STORE_DISCLAIMER_APPEARANCE_CHANGE_CN");
take("BLIZZARD_STORE_DISCLAIMER_NAME_CHANGE_CN");
take("BLIZZARD_STORE_DISCLAIMER_CHARACTER_TRANSFER");
take("BLIZZARD_STORE_DISCLAIMER_CHARACTER_TRANSFER_CN");
take("BLIZZARD_STORE_BOOST_UNREVOKED_CONSUMPTION");

-- For Battle.net Token
if ( IsGMClient() ) then
	C_WowTokenFakeSecure = C_WowTokenSecure;
	retain("C_WowTokenFake")
end
take("C_WowTokenSecure");
retain("C_WowTokenPublic");
take("TOKEN_REDEEM_LABEL");
take("TOKEN_REDEEM_GAME_TIME_TITLE");
take("TOKEN_REDEEM_GAME_TIME_DESCRIPTION");
take("TOKEN_REDEEM_GAME_TIME_EXPIRATION_FORMAT");
take("TOKEN_REDEEM_GAME_TIME_RENEWAL_FORMAT");
take("TOKEN_REDEEM_GAME_TIME_BUTTON_LABEL");
take("TOKEN_CONFIRMATION_TITLE");
take("TOKEN_COMPLETE_TITLE");
take("TOKEN_CREATE_AUCTION_TITLE");
take("TOKEN_BUYOUT_AUCTION_TITLE");
take("TOKEN_CONFIRM_CREATE_AUCTION");
take("TOKEN_CONFIRM_CREATE_AUCTION_LINE_2");
take("TOKEN_CONFIRM_GAME_TIME_DESCRIPTION");
take("TOKEN_CONFIRM_GAME_TIME_DESCRIPTION_MINUTES");
take("TOKEN_CONFIRM_GAME_TIME_EXPIRATION_CONFIRMATION_DESCRIPTION");
take("TOKEN_CONFIRM_GAME_TIME_RENEWAL_CONFIRMATION_DESCRIPTION");
take("TOKEN_COMPLETE_GAME_TIME_DESCRIPTION");
take("TOKEN_BUYOUT_AUCTION_CONFIRMATION_DESCRIPTION");
take("TOKEN_PRICE_LOCK_EXPIRE");
take("TOKEN_CURRENT_AUCTION_VALUE");
take("TOKEN_REDEEM_GAME_TIME_EXPIRATION_FORMAT_MINUTES");
take("TOKEN_COMPLETE_GAME_TIME_DESCRIPTION_MINUTES");
take("TOKEN_REDEEM_GAME_TIME_BUTTON_LABEL_MINUTES");
take("TOKEN_REDEEM_GAME_TIME_DESCRIPTION_MINUTES");
take("TOKEN_TRANSACTION_IN_PROGRESS");
take("TOKEN_YOU_WILL_BE_LOGGED_OUT");
take("TOKEN_REDEMPTION_UNAVAILABLE");
retain("TOKEN_MARKET_PRICE_NOT_AVAILABLE");

retain("GOLD_AMOUNT_SYMBOL");
retain("GOLD_AMOUNT_TEXTURE");
retain("GOLD_AMOUNT_TEXTURE_STRING");
retain("SILVER_AMOUNT_SYMBOL");
retain("SILVER_AMOUNT_TEXTURE");
retain("SILVER_AMOUNT_TEXTURE_STRING");
retain("COPPER_AMOUNT_SYMBOL");
retain("COPPER_AMOUNT_TEXTURE");
retain("COPPER_AMOUNT_TEXTURE_STRING");
retain("SHORTDATE");
retain("SHORTDATE_EU");
retain("AUCTION_TIME_LEFT1_DETAIL");
retain("AUCTION_TIME_LEFT2_DETAIL");
retain("AUCTION_TIME_LEFT3_DETAIL");
retain("AUCTION_TIME_LEFT4_DETAIL");
retain("WEEKS_ABBR");
retain("DAYS_ABBR");
retain("HOURS_ABBR");
retain("MINUTES_ABBR");
retain("OKAY");
retain("LARGE_NUMBER_SEPERATOR");
retain("DECIMAL_SEPERATOR");
retain("TOOLTIP_DEFAULT_COLOR");
retain("TOOLTIP_DEFAULT_BACKGROUND_COLOR");
retain("ACCEPT");
retain("CANCEL");
retain("CREATE_AUCTION");
retain("CONTINUE");
retain("OPTIONS");
retain("FACTION_HORDE");
retain("FACTION_ALLIANCE");
retain("LIST_DELIMITER");

take("BLIZZARD_CHALLENGE_SUBMIT");
take("BLIZZARD_CHALLENGE_CANCEL");
take("BLIZZARD_CHALLENGE_CONNECTING");
take("BLIZZARD_CHALLENGE_OKAY");
take("BLIZZARD_CHALLENGE_DENIED_TITLE");
take("BLIZZARD_CHALLENGE_DENIED_DESCRIPTION");
take("BLIZZARD_CHALLENGE_ERROR_TITLE");
take("BLIZZARD_CHALLENGE_ERROR_DESCRIPTION");
take("BLIZZARD_CHALLENGE_SCREEN_EXPLANATION");

take("SEND_ITEMS_TO_STRANGER_WARNING");
take("SEND_MONEY_TO_STRANGER_WARNING");
take("TRADE_ACCEPT_CONFIRMATION");

--Lua enums
take("LE_STORE_ERROR_INVALID_PAYMENT_METHOD");
take("LE_STORE_ERROR_PAYMENT_FAILED");
take("LE_STORE_ERROR_WRONG_CURRENCY");
take("LE_STORE_ERROR_BATTLEPAY_DISABLED");
take("LE_STORE_ERROR_INSUFFICIENT_BALANCE");
take("LE_STORE_ERROR_OTHER");
take("LE_STORE_ERROR_ALREADY_OWNED");
take("LE_STORE_ERROR_PARENTAL_CONTROLS_NO_PURCHASE");
take("LE_STORE_ERROR_PURCHASE_DENIED");
take("LE_STORE_ERROR_CONSUMABLE_TOKEN_OWNED");
take("LE_STORE_ERROR_TOO_MANY_TOKENS");
take("LE_STORE_ERROR_ITEM_UNAVAILABLE");
take("LE_VAS_SERVICE_NAME_CHANGE");
take("LE_VAS_SERVICE_APPEARANCE_CHANGE");
take("LE_VAS_SERVICE_FACTION_CHANGE");
take("LE_VAS_SERVICE_RACE_CHANGE");
take("LE_VAS_SERVICE_CHARACTER_TRANSFER");
take("LE_VAS_ERROR_REALM_NOT_ELIGIBLE");
take("LE_VAS_ERROR_CANNOT_MOVE_GUILDMASTER");
take("LE_VAS_ERROR_DUPLICATE_CHARACTER_NAME");
take("LE_VAS_ERROR_HAS_MAIL");
take("LE_VAS_ERROR_UNDER_MIN_LEVEL_REQ");
take("LE_VAS_ERROR_TOO_MUCH_MONEY_FOR_LEVEL");
take("LE_VAS_ERROR_HAS_AUCTIONS");
take("LE_VAS_ERROR_NAME_NOT_AVAILABLE");
take("LE_VAS_ERROR_LAST_RENAME_TOO_RECENT");
take("LE_VAS_ERROR_CUSTOMIZE_ALREADY_REQUESTED");
take("LE_VAS_ERROR_LAST_CUSTOMIZE_TOO_RECENT");
take("LE_VAS_ERROR_FACTION_CHANGE_TOO_SOON");
take("LE_VAS_ERROR_RACE_CLASS_COMBO_INELIGIBLE");
take("LE_VAS_ERROR_INELIGIBLE_MAP_ID");
take("LE_VAS_ERROR_BATTLEPAY_DELIVERY_PENDING");
take("LE_VAS_ERROR_HAS_WOW_TOKEN");
take("LE_VAS_ERROR_CHAR_LOCKED");
take("LE_VAS_ERROR_LAST_SAVE_TOO_RECENT");
retain("LE_CONSUMABLE_TOKEN_REDEEM_FOR_SUB_AMOUNT_30_DAYS");
retain("LE_CONSUMABLE_TOKEN_REDEEM_FOR_SUB_AMOUNT_2700_MINUTES");
retain("LE_TOKEN_RESULT_SUCCESS");
retain("LE_TOKEN_RESULT_ERROR_OTHER");
retain("LE_TOKEN_RESULT_ERROR_DISABLED");
take("LE_VAS_PURCHASE_STATE_INVALID");
take("LE_VAS_PURCHASE_STATE_PRE_PURCHASE");
take("LE_VAS_PURCHASE_STATE_PAYMENT_PENDING");
take("LE_VAS_PURCHASE_STATE_APPLYING_LICENSE");
take("LE_VAS_PURCHASE_STATE_READY");
take("LE_VAS_PURCHASE_STATE_PROCESSING_FACTION_CHANGE");
take("LE_VAS_PURCHASE_STATE_PROCESSING_COMPLETE");
take("LE_BATTLEPAY_PRODUCT_ITEM_LEVEL_90_CHARACTER_UPGRADE");
take("LE_BATTLEPAY_PRODUCT_ITEM_LEVEL_100_CHARACTER_UPGRADE");
take("LE_BATTLEPAY_PRODUCT_ITEM_7_0_BOX_LEVEL");