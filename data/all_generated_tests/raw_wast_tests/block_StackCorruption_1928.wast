;; Test 9: Alternating `block` and `loop` instructions, where `loop` instructions manipulate the stack within the `block`. Check that forward branches correctly maintain stack integrity when transitioning between loop iterations and reaching `end`.

(assert_invalid
  (module (func $type-block-loop-stack-manipulation (result i32)
    (block (result i32)
      (loop 
        (br 1 (i32.const 42)) 
        (br 0)
      )
      (i32.const 5)
    )
  ))
  "type mismatch"
)