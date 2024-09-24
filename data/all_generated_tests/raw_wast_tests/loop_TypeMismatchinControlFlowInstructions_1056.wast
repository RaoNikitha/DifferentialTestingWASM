;; 7. Form a `loop` block that expects a particular type `[i32]` but uses a type mismatch in the `blocktype` itself, like specifying a `typeidx` referencing a function type `[i32] -> [f32]`. This tests if function type mismatches are correctly handled.

(assert_invalid
  (module (func $type-mismatch-loop
    (loop (type 0) (result f32) (i32.const 0))
  ) (type (func (param i32) (result i32))))
  "type mismatch"
)