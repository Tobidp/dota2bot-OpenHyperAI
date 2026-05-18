if modifier_lina_dragon_slave_burn == nil then
    modifier_lina_dragon_slave_burn = class({})
end

function modifier_lina_dragon_slave_burn:IsHidden()
    return true
end

function modifier_lina_dragon_slave_burn:IsDebuff()
    return true
end

function modifier_lina_dragon_slave_burn:IsPurgable()
    return true
end

function modifier_lina_dragon_slave_burn:RemoveOnDeath()
    return true
end
