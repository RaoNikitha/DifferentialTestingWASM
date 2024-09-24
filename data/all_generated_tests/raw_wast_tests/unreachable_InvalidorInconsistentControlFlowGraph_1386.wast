;; 7. **Test: `unreachable` in Interleaving Blocks**    - **Goal:** Assess CFG interpretation in interleaved block structures.    - **Description:** Create multiple interleaving blocks where various nested levels contain `unreachable`. Ensure that encountering `unreachable` causes a trap, halting execution irrespective of surrounding block complexity.    - **Constraint Checked:** CFG interpretation with interleaved block structures containing `unreachable`.

(assert_invalid
  (module
    (func $interleaving-blocks-with-unreachable
      (block
        (i32.const 1)
        (block
          (i32.const 2)
          (block
            (i32.const 3)
            (unreachable)
            (i32.const 4)  ;; This should not execute
          )
          (i32.const 5)  ;; This should not execute
        )
        (i32.const 6)  ;; This should not execute
      )
      (i32.const 7)  ;; This should not execute
    )
  )
  "type mismatch"
)