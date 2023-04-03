local mysql = exports.oxmysql

RegisterCommand("odbierz", function(source, args, rawCommand)
  local playerIdentifier = GetPlayerIdentifier(source, 0) -- Pobranie identyfikatora gracza.
  if not HasPlayerReceivedStartingItems(playerIdentifier) then -- Sprawdzenie, czy gracz już odebrał przedmioty startowe.
    GivePlayerStartingItems(source) -- Przekazanie przedmiotów startowych graczowi.
    SavePlayerStartingItems(playerIdentifier) -- Zapisanie informacji o odebraniu przedmiotów startowych przez gracza do bazy danych.
    TriggerClientEvent("chat:addMessage", source, { args = { "^1System", "Otrzymałeś przedmioty startowe!" } }) -- Wysłanie wiadomości do gracza.
  else
    TriggerClientEvent("chat:addMessage", source, { args = { "^1System", "Już odebrałeś przedmioty startowe!" } }) -- Wysłanie wiadomości do gracza.
  end
end)

function HasPlayerReceivedStartingItems(playerIdentifier)
  local result = mysql:executeSync("SELECT * FROM starting_items WHERE identifier = ?", {playerIdentifier})
  if result[1] ~= nil then
    return true
  else
    return false
  end
end

function GivePlayerStartingItems(playerId)
  -- Przekazanie przedmiotów startowych do gracza (można dostosować według własnych potrzeb).
  -- Na przykład:
  -- TriggerClientEvent("esx:giveInventoryItem", playerId, "item", "bread", 5)
  -- TriggerClientEvent("esx:giveInventoryItem", playerId, "item", "water", 5)
end

function SavePlayerStartingItems(playerIdentifier)
  mysql:execute("INSERT INTO starting_items (identifier) VALUES (?)", {playerIdentifier})
end
