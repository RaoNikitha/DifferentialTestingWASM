;; 3. A `loop` instruction within a function that conditionally calls multiple exported functions from another module. The goal is to test proper branching and context handling after returning from multiple nested imports.

(assert_invalid
  (module
    (import "external" "func1" (func $func1 (param i32) (result i32)))
    (import "external" "func2" (func $func2 (param i32) (result i32)))
    (func $test
      (local i32)
      (i32.const 5)
      (set_local 0)
      (loop
        (call $func1 (get_local 0))
        (i32.const 1)
        (i32.sub)
        (set_local 0)
        (call $func2 (get_local 0))
        (br_if 0 (i32.gt_s (get_local 0) (i32.const 0)))
      )
    )
  )
  "type mismatch"
)