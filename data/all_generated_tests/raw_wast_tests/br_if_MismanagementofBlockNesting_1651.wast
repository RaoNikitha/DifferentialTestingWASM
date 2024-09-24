;; 2. **Test Description**: Construct a test with a loop containing nested `if` conditions. Place a `br_if` instruction targeting the loop, ensuring the backward jump re-enters the loop correctly with the proper operand stack state.    - **Constraint Checked**: Proper handling of backward jumps and operand stack preservation to the loop's entry.    - **Relation to Mismanagement of Block Nesting**: Incorrect handling could lead to execution continuing outside the loop.

(assert_invalid
  (module
    (func $test-backward-br_if-loop
      (loop $loop
        (i32.const 1)
        (if
          (then
            (i32.const 1)
            (br_if 0 (i32.const 1))
            (br $loop)
          )
          (else
            (i32.const 0)
            (br_if $loop (i32.const 0))
          )
        )
      )
    )
  )
  "invalid target"
)