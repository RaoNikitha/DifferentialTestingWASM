;; 5. Test an imported function that contains an `unreachable` instruction and is called within a loop in the importing module. This evaluates correct loop termination and control flow handling when a trap occurs.

(assert_invalid
  (module
    (import "test" "funcWithUnreachable" (func $funcWithUnreachable (result i32)))
    (func $test-loop (result i32)
      (local $i i32)
      (loop $loop
        (local.set $i (call $funcWithUnreachable))
        (br_if $loop (i32.const 0))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)