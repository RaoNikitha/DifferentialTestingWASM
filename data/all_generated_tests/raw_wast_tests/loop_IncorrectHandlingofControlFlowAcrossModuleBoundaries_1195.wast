;; Test 6: Create a module exporting a function with nested loops and multiple branch instructions, being called by another module. Check for differential behavior on how the inner loop’s completion affects control flow management when returning to the calling module.

(assert_invalid
  (module
    (func $nested_loops
      (loop
        (i32.const 0)
        (loop
          (br 1)
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)