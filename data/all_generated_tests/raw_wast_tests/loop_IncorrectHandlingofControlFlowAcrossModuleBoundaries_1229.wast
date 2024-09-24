;; 10. **Test Description**: Design a module with a `loop` instruction exporting a function that calls an imported function with nested loops and backward branching using `br`. The test involves validating the proper reset and continuation of the loop execution state during the transition across module boundaries, ensuring no stack corruption or execution anomalies.

(assert_invalid
  (module
    (import "env" "external_func" (func $external (param i32)))
    (func $test
      (local i32)
      (i32.const 10)
      (loop $outer
        (loop $inner
          (local.set 0)
          (call $external (local.get 0))
          (i32.const 0)
          (br_if 1)
          (br 0)
        )
        (i32.const 0)
        (br 0)
      )
    )
  )
)