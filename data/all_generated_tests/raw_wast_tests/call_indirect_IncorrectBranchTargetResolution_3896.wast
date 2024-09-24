;; 5. **Test Description:**    Test a `call_indirect` instruction pointing to a function where a `br` targets a `try` block. Ensure the branch correctly lands into the `catch` block upon encountering an exception. Any deviation in target label landing exposes Incorrect Branch Target Resolution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (result i32)
      try
        (i32.const 42)
        (throw 0)
      catch
        (br 0)
      end
    )
    (func $caller (result i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)