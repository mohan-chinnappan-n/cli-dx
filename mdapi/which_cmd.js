const cp = require("child_process");
let os = process.platform;
if (/^win/i.test(process.platform)) {
   os = 'windows';
}
console.log(os); 
const where =  os === 'windows' ? 'where' : 'which';
cp.exec(`${where} pmd-run.sh`, (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
});
