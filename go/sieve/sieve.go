package sieve

func Sieve(limit int) []int {
	if limit < 2 {
		return []int{}
	}

	// We'll consider the default false value to mean the number IS prime,
	// and mark the non-prime numbers as true.
	markers := make([]bool, limit + 1)
	markers[0] = true
	markers[1] = true

	for i := range markers {
		if markers[i] { continue }

		multiple := i + i
		for multiple <= limit {
			markers[multiple] = true
			multiple += i
		}
	}

	// Copy only the prime numbers into a new array.
	var primes []int
	for i, v := range markers {
		if !v {
			primes = append(primes, i)
		}
	}

	return primes
}
