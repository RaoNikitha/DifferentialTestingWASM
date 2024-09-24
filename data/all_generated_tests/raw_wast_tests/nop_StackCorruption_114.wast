;; 5. Insert multiple `nop` instructions within a structured control sequence involving `loop` and `br_if` to confirm that the instruction handler skips the `nop` effectively without corrupting the stack in iterative branching.

(assert_invalid
  (module
    (func (block (loop (nop) (br_if 1 (i32.const 1))))))
  "type mismatch"
)