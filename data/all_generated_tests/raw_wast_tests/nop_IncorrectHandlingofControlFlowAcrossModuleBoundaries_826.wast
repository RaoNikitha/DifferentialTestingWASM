;; 7. **Test 7: `nop` Before Exported Function with Multiple Returns**    - Use a `nop` before calling an exported function with multiple return paths.    - Check that the correct control flow path is followed regardless of the `nop`.

 ;; (module
  (func $multiplePaths (result i32)
    (i32.const 0)
    (if (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 2)
        (i32.const 3))))
  (export "test" (func $multiplePaths)))

(module (func (nop) (call $multiplePaths)) (export "test" (func 0)))