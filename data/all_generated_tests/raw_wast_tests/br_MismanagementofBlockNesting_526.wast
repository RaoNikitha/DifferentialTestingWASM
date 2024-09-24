;; 7. Design a structure where a `loop` is nested inside a `block`, and place a `br` instruction in the `loop` to break to the outer block. Verify correct control flow transition after the outer block’s `end`. This tests the ability to handle `br` instruction when nested structures include loops.

(assert_invalid
  (module
    (func $nested-loop-break
      (block
        (loop
          (br 1)  ;; Attempt to break to the outer block
        )
        (nop)   ;; No operation to maintain structure
      )
      (i32.const 1)  ;; Simulate stack operation
      (drop)  ;; Clean up the stack
    )
  )
  "type mismatch"
)