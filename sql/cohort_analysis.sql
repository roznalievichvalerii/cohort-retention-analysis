WITH users_parsed AS (
    SELECT
        u.user_id,
        u.promo_signup_flag,
        CASE
            WHEN LENGTH(
                SPLIT_PART(
                    REPLACE(
                        REPLACE(
                            LEFT(TRIM(u.signup_datetime),
                                 POSITION(' ' IN TRIM(u.signup_datetime)) - 1
                            ),
                            '.', '-'
                        ),
                        '/', '-'
                    ),
                    '-',
                    3
                )
            ) = 4
                THEN TO_DATE(
                    REPLACE(
                        REPLACE(
                            LEFT(TRIM(u.signup_datetime),
                                 POSITION(' ' IN TRIM(u.signup_datetime)) - 1
                            ),
                            '.', '-'
                        ),
                        '/', '-'
                    ),
                    'DD-MM-YYYY'
                )
            ELSE TO_DATE(
                    REPLACE(
                        REPLACE(
                            LEFT(TRIM(u.signup_datetime),
                                 POSITION(' ' IN TRIM(u.signup_datetime)) - 1
                            ),
                            '.', '-'
                        ),
                        '/', '-'
                    ),
                    'DD-MM-YY'
                )
        END AS signup_date
    FROM project.cohort_users_raw u
),
events_parsed AS (
    SELECT
        e.user_id,
        e.event_type,
        CASE
            WHEN LENGTH(
                SPLIT_PART(
                    REPLACE(
                        REPLACE(
                            LEFT(TRIM(e.event_datetime),
                                 POSITION(' ' IN TRIM(e.event_datetime)) - 1
                            ),
                            '.', '-'
                        ),
                        '/', '-'
                    ),
                    '-',
                    3
                )
            ) = 4
                THEN TO_DATE(
                    REPLACE(
                        REPLACE(
                            LEFT(TRIM(e.event_datetime),
                                 POSITION(' ' IN TRIM(e.event_datetime)) - 1
                            ),
                            '.', '-'
                        ),
                        '/', '-'
                    ),
                    'DD-MM-YYYY'
                )
            ELSE TO_DATE(
                    REPLACE(
                        REPLACE(
                            LEFT(TRIM(e.event_datetime),
                                 POSITION(' ' IN TRIM(e.event_datetime)) - 1
                            ),
                            '.', '-'
                        ),
                        '/', '-'
                    ),
                    'DD-MM-YY'
                )
        END AS event_date
    FROM project.cohort_events_raw e
),
user_activity AS (
    SELECT
        u.user_id,
        DATE_TRUNC('month', u.signup_date)::date AS cohort_month,
        u.promo_signup_flag,
        DATE_TRUNC('month', e.event_date)::date AS activity_month,
        (
            EXTRACT(YEAR FROM e.event_date) * 12
            + EXTRACT(MONTH FROM e.event_date)
            - EXTRACT(YEAR FROM u.signup_date) * 12
            - EXTRACT(MONTH FROM u.signup_date)
        )::int AS month_offset
    FROM users_parsed u
    JOIN events_parsed e
        ON u.user_id = e.user_id
    WHERE u.signup_date IS NOT NULL
      AND e.event_date IS NOT NULL
      AND e.event_type IS NOT NULL
      AND e.event_type <> 'test_event'
)
SELECT
    promo_signup_flag,
    cohort_month,
    month_offset,
    COUNT(DISTINCT user_id) AS users_total
FROM user_activity
WHERE activity_month BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY
    promo_signup_flag,
    cohort_month,
    month_offset
ORDER BY
    promo_signup_flag,
    cohort_month,
    month_offset;
