package meetup

import "time"

type WeekSchedule int

const (
	First  WeekSchedule = 1
	Second              = 8
	Teenth              = 13
	Third               = 15
	Fourth              = 22
	Last                = -6
)

func Day(sched WeekSchedule, weekday time.Weekday, month time.Month, year int) int {
	if sched == Last {
		month += 1
	}

	d := time.Date(year, month, int(sched), 0, 0, 0, 0, time.UTC)
	return d.Day() + int(weekday-d.Weekday()+7)%7
}
