// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
    switch (name) {
    case 'Pure Strawberry Joy':
        return 0.5;

    case 'Energizer':
    case 'Green Garden':
        return 1.5;

    case 'Tropical Island':
        return 3.0;

    case 'All or Nothing':
        return 5.0;

    default:
        return 2.5;
    }
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
    let currentCutLimeCount = 0;
    let currentWedgeCount   = 0;
    let remainingLimes      = limes.slice(0);

    let i = 0;
    while (currentWedgeCount < wedgesNeeded && remainingLimes.length > 0) {
        const lime = remainingLimes.shift();
        currentCutLimeCount += 1;

        switch (lime) {
        case 'small':
            currentWedgeCount += 6;
            break;

        case 'medium':
            currentWedgeCount += 8;
            break;

        case 'large':
            currentWedgeCount += 10;
            break;
        }
    }

    return currentCutLimeCount;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
    const remainingOrders = orders.slice(0);

    while (timeLeft > 0) {
        const nextOrder = remainingOrders.shift();
        timeLeft -= timeToMixJuice(nextOrder);
    }

    return remainingOrders;
}
