;; Develop a test combining `block`, `loop`, and `if-else` structures with a `br` instruction targeting a label (`label 4`) far out of the current nesting hierarchy. Check for proper error handling and expose any label resolution flaws.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (if (i32.const 1)
            (then
              (block
                (br 4)
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)