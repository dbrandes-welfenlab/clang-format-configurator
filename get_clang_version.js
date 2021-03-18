const got = require('got');
const cheerio = require('cheerio');

//give min clang version as commandline parameter
const min_version = parseInt(process.argv[2], 10);

(async () => {
	try {
		const response = await got('https://releases.llvm.org');
		const $ = cheerio.load(response.body);
		script = $("script").html();

		//ugly splitting in single instructions
		split_sc = script.split(";");
		for (instruction of split_sc) {
			if (instruction.includes('var RELEASES =')) { 
				//get only array assembly
				split_eq = instruction.split("=")
				releases_txt_single = split_eq[1];
				//"convert" to json.
				releases_txt_double = releases_txt_single.replace(/'/g,"\"");
			}
		}
		const releases = JSON.parse(releases_txt_double);
		version_string = ""
		for (release_lst of releases) {
			release = release_lst[1]
			if (release.endsWith(".0")) {
				major = parseInt(release.split(".")[0],10);
				if (major >= min_version) {
					version_string += release + " "
				}
			}
		}
		console.log(version_string);
	} catch (error) {
		console.log(error)
	}
})();
