;; 5. **Test: Unreachable with Control Instructions**    - Sequence `if`, `else`, `block`, `loop` with `unreachable` interleaved between them. The subsequent `br` or `br_if` could continue execution.    - **Stack Corruption Check:** Check how control instructions and their jumps handle the stack post-`unreachable`.

(assert_invalid
  (module (func $test-unreachable-control
    (if (i32.const 1) (then
      unreachable
    ) (else
      (br 0)
    ))
    i32.const 1
  ))
  "type mismatch"
)