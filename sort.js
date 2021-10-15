/*
README: This sorts a list of strings by you. That's it; be not afraid.
HOW TO USE IT:
    0. Install node.js (https://nodejs.org/en/download/)
    1. Create a `.js` file with this code, or `wget` this file, etc.
    2. Put your input in the list of strings at the bottom, such as potential teams,
    3. run `node handsort.js`
    4. answer questions until your rank ordering is disambiguated.
*/

async function merge(A, temp, cmp, frm, mid, to) {
    let k = frm;
    let i = frm;
    let j = mid + 1;

    while (i <= mid && j <= to) {
        if (await cmp(A[i], A[j]) < 0) {
            temp[k++] = A[i++];
        } else {
            temp[k++] = A[j++];
        }
    }

    while (i <= mid) { temp[k++] = A[i++]; }
    while (j <= to) { temp[k++] = A[j++]; }
    for(let b = frm; b <= to; b++) { A[b] = temp[b]; }
}

// Iterative merge sort according to a globally intransitive comparator, such as the human brain.
async function mergeSort(arr, cmp) {
    let low = 0;
    let high = arr.length-1;
    let temp = new Array(arr.length);
    let m = 1;

    while (m <= high-low) {
        for(let i = low; i < high; i += 2*m) {
            let frm = i;
            let mid = i + m - 1;
            let to = Math.min(i + (2*m) - 1, high);
            await merge(
                arr, temp, cmp,
                frm, mid, to
            );
        }
        m = 2*m;
    }
    return arr;
}

function getAsker() {
    return require("readline").createInterface({
        input: process.stdin,
        output: process.stdout,
    });
}

async function handCmp(left, right) {
    if (left == right) {
        return 0;
    }

    const asker = getAsker();

    var res = "";
    process.stdout.write(`[KEY+BACK=HIDE] Does [${left}] beat [${right}]? (y/n/=): `);
    for await (const line of asker) {
        res = line;
        if (res !== "y" && res !== "n" && res !== "=") {
            console.log(
                "Try pressing one of these keys this time, my fellow wrinkle-brain: `y` `n` `=`"
            );
        } else {
            break;
        }
    }

    if (res == "y") {
        return -1;
    } else if (res == "n") {
        return 1;
    } else if (res == "=") {
        return 0;
    }
}

async function handSort(items) {
    return await mergeSort(items, handCmp);
}

function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {
        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }

    return array;
}

var input = shuffle([ // Teams? Music? Priorities? Candies?
        "FAST Data",
        "IGML Data",
        "Network Routing",
        "Messaging Infra Team",
        "Instagram Search Ranking",
        "Ads Serving Reliability"
    ]);

(async () => {
    // debugging
    // console.log(`input: ${input}`);
    let output = await handSort(input);
    count = 0;
    console.log("\nYour rank ordering (highest to lowest):");
    for (const song of output) {
        count += 1;
        console.log(`#${count}: ${song}`);
    }
    console.log("\nFeedback: `egd`");
})();

/*
THIS IS GOING TO ASK YOU A SERIES OF QUESTIONS, DONE ENTIRELY LOCALLY ON YOUR COMPUTER AS YOU JUST SAW.
KEY+BACK TO ERASE THE PRINTED LINE WITHOUT CANCELLING THE QUESTION IN PUBLIC OR OTHER SURVEILING AREAS.

Those questions will come in the form "Does X beat Y?" from the input list you populate above.
You may answer with `y` in the affirmative, or `=` for parity, or `n` for otherwise.

It is NOT possible for you to make conflicting decisions in this algorithm, so do not worry about it!

Your rankings will be printed out as soon as your decisions have disambiguated them.
This can be used to rank literally anything from anywhere, by the way!

IT'S...

...Faster and cheaper to get the rank-order job done.
...Free of magical thinking and cognitive dissonance!
...Bound to become a `bunny` command in no time flat?

Do this a few times throughout the day if you need to build a statistical model of your sensibilities.

P.S. PLEASE DO NOT RANK CRYPTOGRAPHIC SECRETS!
*/
