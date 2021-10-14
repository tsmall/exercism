package hamming

import "errors"

// Distance calculates the Hamming Distance between the two DNA strands
// represented by strings a and b. The two strings must be the same length;
// if they are not, an error is returned.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("strings must be the same length")
	}

	brs := []rune(b)
	d := 0
	for i, r := range a {
		if r != brs[i] {
			d++
		}
	}

	return d, nil
}
