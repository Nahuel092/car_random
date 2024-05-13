local lista = {
    'blista',
    'prairie',
    'previon',
    'dukes',
    'everon',
    'trophytruck',
    'tailgater2',
    'warrener',
    'drafter',
    'schafter2',
    'sugoi',
    'xa21'
}

RegisterCommand('+random_car', function()
    local player = PlayerPedId() -- ID del Jugador
    local coords = GetEntityCoords(player) -- Cordenadas del jugador
    local heading = GetEntityHeading(player) -- Cordenadas donde mira el jugador
    local ModelHash = lista[math.random(1, #lista)] -- Llamar a lista random (lee la lista del 1 al utlimo numero)
    local veh = GetVehiclePedIsUsing(player) -- Comprueba si el jugador esta en un vehiculo
    print(ModelHash)
    if not HasModelLoaded(ModelHash) then  
        RequestModel(ModelHash) -- Pide el modelo del vehiculo
    end    
    if IsPedInAnyVehicle(player) then -- Pregunta si un jugar esta un vehiculo
        SetEntityAsMissionEntity(veh, true, true) 
        DeleteVehicle(veh) -- Borra el vehiculo que este el jugador
    end
    local vehicle = CreateVehicle(ModelHash, coords, heading, true, false) -- Crea el vehiculo
    TaskWarpPedIntoVehicle(player, vehicle, -1) -- Meter a Jugador en vehiculo
    SetVehicleDirtLevel(vehicle, 0.0) -- Limpia el vehiculo
    SetVehicleNumberPlateText(vehicle, 'ARGENTO') -- Cambia la patente
    Wait(2000) -- 2 segundos
    SetVehicleCustomPrimaryColour(vehicle, 14, 208, 242) -- Cambia el color primario Turquesa
    SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0) -- Cambia el color secundario Negro
end)

--GetHashKey('sultan')