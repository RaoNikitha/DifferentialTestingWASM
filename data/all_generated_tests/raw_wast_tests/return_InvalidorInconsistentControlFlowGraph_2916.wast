;; **Test 5: Unreachable Code Post-Return**  Create a function where the return instruction is followed by additional operations. This tests CFG’s detection of unreachable code. The WebAssembly should optimize away or flag the unreachable operations post-return. Wizard Engine should signal or handle the unreachable code segment, ensuring the CFG correctly identifies and handles such scenarios.  _Checks CFG accuracy in dealing with unreachable code after returns are issued._

(assert_invalid
  (module
    (func $unreachable-code-post-return
      (return)
      (i32.const 42)
    )
  )
  "unreachable code"
)