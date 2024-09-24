;; **Test 3**: Nest multiple `call` instructions within each other, invoking a chain of three or more functions. - **Constraint Checked**: Proper stack frame handling for nested calls. - **Stack Corruption Risk**: Improper nested call handling could disrupt the base stack frame in wizard_engine, resulting in corrupted results returned to the caller.

(assert_invalid
 (module
  (func $f1 (call $f2))
  (func $f2 (param i32) (call $f3 (i32.const 0)))
  (func $f3 (param i32 i32))
 )
 "type mismatch"
)