;; 6. Construct a module with an outer `loop` expecting `i32` types and an inner block where the `br` instruction attempts to resume execution after the loop but pushes an `f64` value. This checks whether both engines handle operand types correctly when the branch resumes after the `loop`.

(assert_invalid
  (module
    (func $type-mismatch-resume-after-loop
      (loop $L1 (i32.const 1) (block (br $L1) (f64.const 3.14)))
    )
  )
  "type mismatch"
)