;; 8. Structure a loop where multiple `br` instructions target different labels within other loops. Faulty stack management might prevent the correct jumping out of the loops, leading to an infinite loop due to a constant reiteration at the most inner level.

(assert_invalid
  (module
    (func $nested-loops-invalid-br
      (loop (block (br 2)
        (loop (block (br 1)
          (loop (block (br 0)
            (br 3)
          ))
        ))
      ))
    )
  )
  "unknown label"
)