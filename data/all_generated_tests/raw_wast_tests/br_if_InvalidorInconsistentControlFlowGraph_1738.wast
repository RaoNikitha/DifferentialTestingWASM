;; 9. **Test 9**:    - **Description**: Intermittent `block` and `loop` structure with `br_if` branching conditioned by operand stack checks, targeting non-immediate outer blocks.    - **Constraint**: Testing multi-level exit branching and stack handling.    - **CFG Relation**: Ensures proper multi-level CFG handling for conditional exits.

(assert_invalid
  (module
    (func $multi_level_br_if
      (block $outer
        (block $inner
          (loop $loop
            (br_if 1 (i32.const 1))  ;; Attempt to branch to $outer
            (br_if 2 (i32.const 1))  ;; Invalid, $outer is 1 level out
          )
        )
      )
    )
  )
  "undefined label"
)