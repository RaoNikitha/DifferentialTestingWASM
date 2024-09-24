;; 10. Test an if instruction followed by another if instruction where the first one has an `unreachable` in the false branch, and the second one has proper evaluation. This checks whether traps impact subsequent, correctly structured if-else.    ```    (module      (func (result i32)        (i32.const 0)        if (result i32)          (i32.const 2)        else          unreachable        end        (i32.const 1)        if (result i32)          (i32.const 4)        else          (i32.const 5)        end      )    )    ```    Constraint: Effect of unreachable on subsequent if-else control.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      if (result i32)
        (i32.const 2)
      else
        unreachable
      end
      (i32.const 1)
      if (result i32)
        (i32.const 4)
      else
        (i32.const 5)
      end
    )
  )
  "unreachable in the false branch of the first if instruction"
)