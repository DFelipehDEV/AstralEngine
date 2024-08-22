/// ease(time, start, change, duration, ease)
switch (argument4)
{
    case "InBack":
        var factorValue;
        factorValue = 1.70158;

        argument0 /= argument3;
        return argument2 * (argument0) * argument0 * ((factorValue + 1) * argument0 - factorValue) + argument1;
        break;

    case "OutBack":
        var factorValue;
        factorValue = 1.70158;

        argument0 = (argument0/argument3) - 1;
        return argument2 * ((argument0) * argument0 * ((factorValue + 1) * argument0 + factorValue) + 1) + argument1;
        break;

    case "InOutBack":
        var factorValue;
        factorValue = 1.70158;
        argument0 /= argument3;
        argument0 *= 2;

        if ((argument0) < 1)
        {
            factorValue *= (1.525);
            return argument2 * 0.5 * (argument0 * argument0 * ((factorValue + 1) * argument0 - factorValue)) + argument1;
        }

        argument0 -= 2;
        factorValue *= 1.525
        return argument2 * 0.5 * ((argument0) * argument0 * ((factorValue + 1) * argument0 + factorValue) + 2) + argument1;
        break;

    case "InCubic":
        return argument2 * power(argument0 / argument3, 3) + argument1;
        break;

    case "OutCubic":
        return argument2 * (power(argument0 / argument3 - 1, 3) + 1) + argument1;
        break;

    case "InOutCubic":
        argument0 /= argument3 * 0.5;

        if (argument0 < 1)
        {
            return (argument2 * 0.5) * power(argument0, 3) + argument1;
        }

        return (argument2 * 0.5) * (power(argument0 - 2, 3) + 2) + argument1;
        break;

    case "InBounce":
        return argument2 - ease(argument3 - argument0, 0, argument2, argument3, "OutBounce") + argument1;
        break;

    case "OutBounce":
        argument0 /= argument3;

        if (argument0 < (1 / 2.75))
        {
            return argument2 * (7.5625 * argument0 * argument0) + argument1;
        }
        else
        if (argument0 < (2 / 2.75))
        {
            argument0 -= (1.5 / 2.75);
            return argument2 * (7.5625 * argument0 * argument0 + 0.75) + argument1;
        }
        else
        if (argument0 < (2.5 / 2.75))
        {
            argument0 -= (2.25 / 2.75);
            return argument2 * (7.5625 * argument0 * argument0 + 0.9375) + argument1;
        }
        else
        {
            argument0 -= ( 2.625 / 2.75 );
            return argument2 * (7.5625 * argument0 * argument0 + 0.984375) + argument1;
        }
        break;

    case "InOutBounce":
        if (argument0 < argument3 * 0.5)
        {
            return (ease(argument0 * 2, 0, argument2, argument3, "InBounce") * 0.5 + argument1);
        }

        return (ease(argument0 * 2 - argument3, 0, argument2, argument3, "OutBounce") * 0.5 + argument2 * 0.5 + argument1);
        break;

    case "InElastic":
        var factorValue, multiValue, changeValue;
        factorValue = 1.70158;
        multiValue = 0;
        changeValue = argument2;

        if (argument0 == 0 || changeValue == 0)
        {
            return argument1;
        }

        argument0 /= argument3;

        if (argument0 == 1)
        {
            return argument1 + argument2;
        }

        if (multiValue == 0)
        {
            multiValue = argument3 * 0.3;
        }

        if (changeValue < abs(argument2))
        {
            changeValue = argument2;
            factorValue = multiValue * 0.25;
        }
        else
        {
            factorValue = multiValue / (2 * pi) * arcsin (argument2 / changeValue);
        }

        return -(changeValue * power(2,10 * (--argument0)) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue)) + argument1;
        break;

    case "OutElastic":
        var factorValue, multiValue, changeValue;
        factorValue = 1.70158;
        multiValue = 0;
        changeValue = argument2;


        if (argument0 == 0 || changeValue == 0)
        {
            return argument1;
        }

        argument0 /= argument3;

        if (argument0 == 1)
        {
            return argument1 + argument2;
        }

        if (!multiValue)
        {
            multiValue = argument3 * 0.3;
        }

        if (changeValue < abs(argument2))
        {
            changeValue = argument2;
            factorValue = multiValue * 0.25;
        }
        else
        {
            factorValue = multiValue / (2 * pi) * arcsin (argument2 / changeValue);
        }

        return changeValue * power(2, -10 * argument0) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue ) + argument2 + argument1;
        break;

    case "InOutElastic":
        var factorValue, multiValue, changeValue;
        factorValue = 1.70158;
        multiValue = 0;
        changeValue = argument2;

        if (argument0 == 0 || changeValue == 0)
        {
            return argument1;
        }

        argument0 /= (argument3 * 0.5);

        if (argument0 == 2)
        {
            return argument1 + argument2;
        }

        if (!multiValue)
        {
            multiValue = argument3 * (0.3 * 1.5);
        }

        if (changeValue < abs(argument2))
        {
            changeValue = argument2;
            factorValue = multiValue * 0.25;
        }
        else
        {
            factorValue = multiValue / (2 * pi) * arcsin (argument2 / changeValue);
        }

        if (argument0 < 1)
        {
            return -0.5 * (changeValue * power(2, 10 * (--argument0)) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue)) + argument1;
        }

        return changeValue * power(2, -10 * (--argument0)) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue) * 0.5 + argument2 + argument1;
        break;

    case "InExpo":
        return argument2 * power(2, 10 * (argument0 / argument3 - 1)) + argument1;
        break;

    case "OutExpo":
        return argument2 * (-power(2, -10 * argument0 / argument3) + 1) + argument1;
        break;

    case "InOutExpo":
        argument0 /= argument3 * 0.5;

        if (argument0 < 1)
        {
            return argument2 * 0.5 * power(2, 10 * (argument0 - 1)) + argument1;
        }

        argument0 -= 1;
        return argument2 * 0.5 * (-power(2, -10 * argument0) + 2) + argument1;
        break;

    case "InQuad":
        argument0 /= argument3;
        return argument2 * argument0 * argument0 + argument1;
        break;

    case "OutQuad":
        argument0 /= argument3;
        return -argument2 * argument0 * (argument0 - 2) + argument1;
        break;

    case "InOutQuad":
        argument0 /= (argument3 * 0.5);

        if (argument0 < 1)
        {
            return (argument2 * 0.5) * (argument0 * argument0) + argument1;
        }

        return (-argument2 * 0.5) * (--argument0 * (argument0 - 2) - 1) + argument1;
        break;

    case "InQuart":
        return argument2 * power(argument0 / argument3, 4) + argument1;
        break;

    case "OutQuart":
        return -argument2 * (power(argument0 / argument3 - 1, 4) - 1) + argument1;
        break;

    case "InOutQuart":
        argument0 /= argument3 * 0.5;

        if (argument0 < 1)
        {
            return argument2 * 0.5 * power(argument0, 4) + argument1;
        }

        return -argument2 * 0.5 * (power(argument0 - 2, 4) - 2) + argument1;
        break;

    case "InQuint":
        return argument2 * power(argument0 / argument3, 5) + argument1;
        break;

    case "OutQuint":
        return argument2 * (power(argument0 / argument3 - 1, 5) + 1) + argument1;
        break;

    case "InOutQuint":
        argument0 /= argument3 * 0.5;

        if (argument0 < 1)
        {
            return argument2 * 0.5 * power(argument0, 5) + argument1;
        }

        return argument2 * 0.5 * (power(argument0 - 2, 5) + 2) + argument1;
        break;

    case "InCirc":
        argument0 /= argument3;
        return argument2 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
        break;

    case "OutCirc":
        argument0 = argument0 / argument3 - 1;
        return argument2 * sqrt(1 - argument0 * argument0) + argument1;
        break;

    case "InOutCirc":
        argument0 /= argument3 * 0.5;

        if (argument0 < 1)
        {
            return argument2 * 0.5 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
        }

        argument0 -= 2;
        return argument2 * 0.5 * (sqrt(1 - argument0 * argument0) + 1) + argument1;
        break;

    case "InSine":
        return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;
        break;

    case "OutSine":
        return argument2 * sin(argument0 / argument3 * (pi / 2)) + argument1;
        break;

    case "InOutSine":
        return argument2 * 0.5 * (1 - cos(pi * argument0 / argument3)) + argument1;
        break;
}
