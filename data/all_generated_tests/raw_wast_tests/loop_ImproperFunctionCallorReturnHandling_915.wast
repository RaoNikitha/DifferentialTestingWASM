;; 6. **Test: Loop with Function Returning Struct Types**     - Description: Create a loop block that calls a function returning a struct type. Check if the return values (struct fields) are accurately managed and pushed on the operand stack after the function call.     - Constraint: Checks for correct handling and stack management of complex return types (e.g., structs) within loop blocks.

(assert_invalid
  (module
    (type $structType (struct (field i32) (field i64)))
    (func $returnStruct (result (ref null $structType))
      (ref.null $structType))
    (func (result (ref null $structType))
      (loop (result (ref null $structType))
        call $returnStruct
      )
    )
  )
  "type mismatch"
)