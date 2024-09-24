;; 3. Design a function calling an indirect function through `call_indirect`. The target function should contain an `unreachable` instruction. Validate if both implementations correctly trap when the indirect call reaches `unreachable`.

(assert_invalid
  (module
    (type $t (func))
    (table 1 anyfunc)
    (elem (i32.const 0) $foo)
    (func $foo
      unreachable
    )
    (func (call_indirect $t (i32.const 0)))
  )
  "type mismatch"
)