;; 10. **Nested Loop with Early Return**: Implement nested loops where an `inner loop` has an `early return` condition affecting the outer loop’s execution. This test checks for correct mismanagement of block nesting through stack integrity post-return, emphasizing the rigorous scope of context validation under extended labels.  By focusing on these scenarios, differential mismanagement of block nesting can be systematically revealed, pinpointing where each implementation might diverge in their adherence to WebAssembly’s loop instruction specifications.

(assert_invalid
  (module (func $nested-loop-early-return
    (loop (result i32)
      (block
        (loop
          (br_if 1 (i32.const 1))
          (br 0)
        )
      )
      (i32.const 42)
    )
  ))
  "type mismatch"
)