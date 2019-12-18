function FRHelper:call(args, main, dt, ...)
    local nighttime = world.timeOfDay() > 0.5
    local underground = world.underground(mcontroller.position())

    local foodValue
    if status.isResource("food") then
        foodValue = status.resourcePercentage("food")
    else
        foodValue = args.foodDefault
    end

    if nighttime or underground and (foodValue >= args.foodThreshold) then
        status.modifyResourcePercentage("health", args.healingRate * dt)

        self:applyStats(args, args.name or "FR_feneroxNightBonus", main, dt, ...)
    else
        self:clearPersistent(args.name or "FR_feneroxNightBonus")
    end
end
