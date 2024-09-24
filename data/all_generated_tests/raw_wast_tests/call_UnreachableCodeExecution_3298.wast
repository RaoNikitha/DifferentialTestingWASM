;; 7. **Test Description**: Define mutually recursive functions where the type validation of one function is dependent on the correct validation of another. A mismanaged validation should cause control flow to hit an 'unreachable' instruction.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (result i32)))
    (func $func1 (result i32)
      (call $func2)
    )
    (func $func2 (result i32)
      (call $func1)
      (unreachable)
    )
  )
  "type mismatch"
)